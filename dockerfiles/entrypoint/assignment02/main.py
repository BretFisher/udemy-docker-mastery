from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from pydantic import BaseModel
import os
from datetime import datetime

app = FastAPI()

# Create data directory if it doesn't exist
os.makedirs("/app/data", exist_ok=True)

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, replace with your frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Example data model
class Item(BaseModel):
    name: str
    description: str | None = None

@app.get("/")
async def root():
    return {"message": "Welcome to FastAPI"}

@app.get("/api/download/{filename}")
async def download_file(filename: str):
    file_path = os.path.join("/app/data", filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail="File not found")
    return FileResponse(file_path, filename=filename)

@app.get("/api/items")
async def get_items():
    try:
        # Get list of files in /app/data directory
        files = os.listdir("/app/data")
        
        # Get detailed information for each file
        file_details = []
        for filename in files:
            file_path = os.path.join("/app/data", filename)
            stats = os.stat(file_path)
            file_details.append({
                "filename": filename,
                "size": stats.st_size,
                "created": datetime.fromtimestamp(stats.st_ctime).isoformat(),
                "modified": datetime.fromtimestamp(stats.st_mtime).isoformat(),
                "download_url": f"http://localhost:8000/api/download/{filename}"
            })
        
        return file_details
    except Exception as e:
        return {"error": str(e)}

@app.post("/api/upload")
async def upload_file(file: UploadFile = File(...)):
    # Create unique filename with timestamp
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"{timestamp}_{file.filename}"
    
    # Save file to /app/data directory
    file_path = os.path.join("/app/data", filename)
    
    try:
        # Read file content
        content = await file.read()
        # Write to disk
        with open(file_path, "wb") as f:
            f.write(content)
        
        return {
            "filename": filename,
            "size": len(content),
            "content_type": file.content_type
        }
    except Exception as e:
        return {"error": str(e)}
