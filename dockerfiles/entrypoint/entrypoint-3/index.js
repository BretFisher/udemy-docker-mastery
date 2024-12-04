// this script is simple, it prints the date and time exactly every second to console

const { exec } = require('child_process');

const printDateTime = () => {
    const now = new Date();
    console.log(now.toISOString());
};

printDateTime();

setInterval(printDateTime, 1000);

// capture SIGTERM and SIGINT and exit gracefully
// process.on('SIGTERM', () => {
//     console.log('SIGTERM signal received: exiting');
//     process.exit(0);
// });

// process.on('SIGINT', () => {
//     console.log('SIGINT signal received: exiting');
//     process.exit(0);
// });
