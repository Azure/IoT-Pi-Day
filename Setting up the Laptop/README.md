# Setting up the Laptop

## Estimated time to complete
- TBD

## Prerequisites
- A Laptop. :smile:

## Install Visual Studio Code

### Download Visual Studio Code
- Click [Visual Studio Code](https://code.visualstudio.com/Download)

    ### Windows
    - Click **Windows 7, 8, 10** button.
    - Click **Run** to execute **VSCodeUserSetup-x64-x.xx.x.exe**
    
    ### Linux
    - Click **Debian, Ubuntu, Red Hate...etc** button.
    - Click **Run** to execute **code_1.30.2-1546901646_amd64.deb**

    ### MacOS
    - Click **Mac** button.
    - Click **Run** to execute **VSCode-darwin-stable.zip**

> Path will automaticly be updated

### Install Extensions
What are Visual Studio Code Extensions? Extensions let you add languages, debuggers, and tools to your installation to support your development workflow. You can browse and install extensions from within Visual Studio Code or from the Command line.

> Note: Some of the extensions will give you a warning message, please ignore and be patient.

**Option 1 - From Visual Studio Code**

- Launch Visual Studio Code
    > Note: Bring up the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of VS Code or the View: Extensions command (**Ctrl+Shift+X**).
- Search for: **Azure Account**, click **Install**
- Search for: **Azure Functions**, click **Install**
- Search for: **Azure IoT Device Workbench**, click **Install**
- Search for: **C#**, click **Install**
- Search for: **Material Icon Theme**, click **Install**
- Search for: **NuGet Package Manager**, click **Install**
- Search for: **Azure CLI Tools**, click **Install**

**Option 2 - From Command Line**

- Open up a **Command Prompt** as an **Administrator**.
- Azure Account, type: **```code --install-extension ms-vscode.azure-account```**
- Azure Functions, type: **```code --install-extension ms-azuretools.vscode-azurefunctions```**
- Azure IoT Device Workbench, type: **```code --install-extension vsciot-vscode.vscode-iot-workbench```**
- C#, type: **```code --install-extension ms-vscode.csharp```**
- Material Icon Theme, type: **```code --install-extension pkief.material-icon-theme```**
- NuGet Package Manager, type: **```code --install-extension jmrog.vscode-nuget-package-manager```**
- Azure CLI Tools, type: **```code --install-extension ms-vscode.azurecli```**

## Install DotNet Core SDK 2.2
.NET Core is a cross-platform version of .NET for building websites, services, and console apps.

<!--
https://github.com/dotnet/core/blob/master/release-notes/2.2/2.2.1/2.2.1-download.md 
-->
To install the SDK, click 
**Windows**
- Under .NET Core 2.2-Build Apps, Click [Download .Net Core SDK](https://dotnet.microsoft.com/download) to execute **dotnet-sdk-2.2.103-win-x64.exe**.

**Linux**
- Under .NET Core 2.2-Build Apps, Click [Install .Net Core SDK](https://dotnet.microsoft.com/download).
- Under Linux Distribution, select your version of Linux and folllow the instructions on the site.

**MacOS**
- Under .NET Core 2.2-Build Apps, Click [Download .Net Core SDK](https://dotnet.microsoft.com/download) to execute **dotnet-sdk-2.2.103-osx-x64.pkg**.

    > Open a a command line as an Administrator and type: **dotnet --info** to confirm installation.
 
### Install Node.js
What is npm? npm makes it easy for JavaScript developers to share and reuse code, and makes it easy to update the code that you’re sharing, so you can build amazing things.

**Windows**

- Option 1
    - Click [Get npm](https://nodejs.org/en/)
    - Under **Download for Windows (x64)**, click **10.15.1 LTS** to execute **node-v10.15.1-x64.msi**
    - Open a a command line as an Administrator.
        > Type: **node --version** to confirm installation.
        > Type **npm --version** to confirm installation.

- Option 2
    - Click [Get npm](https://nodejs.org/en/download/)
    - Click **Windows Installer** to execute **node-v10.15.1-x64.msi**
    - Accept all the defaults to install npm.
 
**MacOS**
- Click [Get npm](https://nodejs.org/en/download/)
- Click **macOS Installer** to execute **node-v10.15.1.pkg**
- Accept all the defaults to install npm.

**Linux**
- Click [Get npm](https://nodejs.org/en/download/)
- Click **64-bit** for the correct version to execute correct file.
    - i.e. **nnode-v11.9.0-linux-ppc64le.tar.xz**
- Accept all the defaults to install npm.

## Install Azure Functions Core Tools
What are Azure Functions Core Tools? The Azure Functions Core Tools provide a local development experience for creating, developing, testing, running, and debugging Azure Functions.

**Windows**
- To install v2 with npm, open a **Node.js Command Prompt** as Adminstrator.
- Type: **npm i -g azure-functions-core-tools --unsafe-perm true**

**MacOS**
- See [Azure Functions Core Tools on the Mac](https://github.com/Azure/azure-functions-core-tools#mac)

**Linux**
- See [Azure Functions Core Tools on the Mac](https://github.com/Azure/azure-functions-core-tools#linux)

## Install Azure Storage Explorer
What is Azure Storage Explorer?  This tool allows you to easily manage the contents of your storage account with Azure Storage Explorer.
- To install, click [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/) to get started.
- Select the correct **Operating System** in the dropdown.
- Click **Download Storage Explorer free**.
- Click **Run** to install.

## Install Telnet Tool

- **Option 1** - To use PuTTY
    - Download the PuTTY SSH and Telnet client and launch it.
        - Click [Download PuTTY](https://www.putty.org/) and click **Download it here** to download the latest version. Use the **MSI Windows Installer - 64-bit**.
        - Click **Run** to accept the default prompts.

- **Option 2** - To use Windows 10
    - Click [How to Enable and Use Windows 10’s New Built-in SSH Commands](https://www.howtogeek.com/336775/how-to-enable-and-use-windows-10s-built-in-ssh-commands/)

<!--
## (Optional) Install Git
What is Git? Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
- Click [Git](https://git-scm.com/) to install.

**Windows**
- Under Latest source Release, click **Download 2.20.1 for Windows** to execute **Git-2.20.1-64-bit.exe**.
- Select all the defaults.

**MacOS**
- Click on **Mac Build** to download **node-v11.9.0.pkg**. 

## (Optional) Install Git Desktop
What is GitHub Desktop? GitHub Desktop extends your GitHub workflow beyond your browser.
- Click [GitHub Desktop](https://desktop.github.com/) to install.

**Windows**
- Click **Download for Windows (64bit)** and **Run** the file **GitHubDesktopSetup.exe**.
- Select all the defaults.

**MacOS**
- Click **Download for macOS** and **Open** the file **GitHubDesktop.zip**.
- Select all the defaults.

-->