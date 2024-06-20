# Airline Ticketing System

## Overview
Brief set up to run as a web application using Visual Studio Community.

## Setup Instructions

### 1. Download the ZIP Folder
Download the ZIP folder containing the project files.

### 2. Extract the ZIP Folder
Extract the contents of the ZIP folder to a desired location on your computer.

### 3. Open the Project in Visual Studio Community
1. Open Visual Studio Community.
2. Go to `File > Open > Web Site...`.
3. Browse to the location where you extracted the ZIP folder.
4. Select the folder and click `Open`.

### 4. Configure the Connection String in `web.config`
1. Locate the `web.config` file in the project directory.
2. Open the `web.config` file.
3. Find the `<connectionStrings>` section.
4. Replace the existing connection string with your own. Example:
    ```xml
    <connectionStrings>
        <add name="MyDatabaseConnection" 
             connectionString="your_connection_string_here" 
             providerName="System.Data.SqlClient" />
    </connectionStrings>
    ```

## Running the Application
1. After setting up the connection string, build the project in Visual Studio.
2. Start the application by clicking the `IIS Express` button or pressing `F5`.
3. The application should now be running and accessible via your web browser.

## Troubleshooting
- Ensure that all necessary software and dependencies are installed.
- Verify that the connection string is correct and the database is accessible.
- Check the Visual Studio output window for any error messages.
