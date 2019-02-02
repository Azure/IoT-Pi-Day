# Setting up the Laptop

## Install Visual Studio Code & Dot Net Core SDK 2.2

### Download Visual Studio Code
- Click [Visual Studio Code](https://code.visualstudio.com/Download)
- Click **Windows 7, 8, 10** button.
- Click **Run** to execute **VSCodeUserSetup-x64-x.xx.x.exe**
 
    > Path will automaticly be updated

### Install Extensions
What are Visual Studio Code Extensions? Extensions let you add languages, debuggers, and tools to your installation to support your development workflow. You can browse and install extensions from within Visual Studio Code or from the Command line.

**From Command Line**

- Open a a command line as an Administrator.
- Azure Account, type: **code --install-extension ms-vscode.azure-account**
- Azure Functions, type: **code --install-extension  - ms-azuretools.vscode-azurefunctions**
- Azure IoT Device Workbench, type: **code --install-extension  - vsciot-vscode.vscode-iot-workbench**
- C#, type: **code --install-extension  ms-vscode.csharp**
- Material Icon Theme, type: **code --install-extension  - pkief.material-icon-theme**
- NuGet Package Manager, type: **code --install-extension  - jmrog.vscode-nuget-package-manager**
- Azure CLI Tools, type: **code --install-extension  - ms-vscode.azurecli**

**From Visual Studio Code**

- Launch Visual Studio Code
    > Bring up the Extensions view by clicking on the Extensions icon in the Activity Bar on the side of VS Code or the View: Extensions command (**Ctrl+Shift+X**).
- Search for: **Azure Account**, click **Install**
- Search for: **Azure Functions**, click **Install**
- Search for: **Azure IoT Device Workbench**, click **Install**
- Search for: **C#**, click **Install**
- Search for: **Material Icon Theme**, click **Install**
- Search for: **NuGet Package Manager**, click **Install**
- Search for: **Azure CLI Tools**, click **Install**

### Install DotNet Core
.NET Core is a cross-platform version of .NET for building websites, services, and console apps.

- Under .NET Core 2.2-Build Apps, Click [Download .Net Core SDK]([https://dotnet.microsoft.com/download) to execute **dotnet-sdk-2.2.103-win-x64.exe**.
    - Open a a command line as an Administrator and type: **run dotnet --info** to confirm installation.
 
### Install Node.js
What is npm? npm makes it easy for JavaScript developers to share and reuse code, and makes it easy to update the code that you’re sharing, so you can build amazing things.
- Click [Get npm](https://nodejs.org/en/)
- Click **Download Node.js and npm**
- Click [10.15.1 LTS](https://www.npmjs.com/get-npm) to execute **node-v10.15.1-x64.msi**
- Open a a command line as an Administrator.
    - Type: **run node --version** to confirm installation.
    - Type **run npm --version** to confirm installation.
 
### Install Azure Functions Core Tools
What are Azure Functions Core Tools? The Azure Functions Core Tools provide a local development experience for creating, developing, testing, running, and debugging Azure Functions.
- To install v2 with npm, open a Command Prompt as Adminstrator.
- Type: **npm i -g azure-functions-core-tools --unsafe-perm true**
    > Docs found at  https://github.com/Azure/azure-functions-core-tools#installing

### Install Git
What is Git? Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.
- Click [Git](https://git-scm.com/)
- Under Latest source Release, click **Download 2.20.1 for Windows** to execute **Git-2.20.1-64-bit.exe**
    > Select all the defaults.
​