# Python Development Template

This is a template for Python development on Docker with VSCode.

You can customize the details according to your own preference.

# Features

- Docker
  - Python 3.10
  - Support for CPU
- Package management with [uv](https://docs.astral.sh/uv/)
- VScode
  - Optimized setup for Python development

# QuickStart with GCP VM

### 1. Install VSCode Locally

- Install [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) (including Remote-SSH and Dev Containers)
- Install [gcloud CLI](https://cloud.google.com/sdk/docs/install). Log in to your account.

### 2. Prepare a VM

Using a Marketplace option is convenient (note that there is a license fee).

1. [For CPU](https://console.cloud.google.com/marketplace/product/cloud-infrastructure-services/docker-compose-ubuntu20) (docker and docker-compose preinstalled)

Note: This template currently supports CPU only. Instead of launching VMs, I now use serverless services for GPU tasks.

You may need to SSH in and perform initial setup, so connect with `gcloud compute ssh` beforehand.

### 3. Connect via SSH in VSCode

- Run `gcloud compute config-ssh` locally

  - Adds the VM connection settings to `~/.ssh/config`
  - Set the user to your own account (Tip: it's a good idea to add it to the end of the config)

  ```
  Host *
      User your_name
  ```

- Select "Open a Remote Window" in the lower left corner. Select "Connect to Host". A list of VMs will appear, so select your own VM.

### 4. Prepare the Dockerfile and .devcontainer on the VM

Clone this repository:

```bash
git clone https://github.com/shunyooo/python-blueprint.git
```

- Login and configure gcloud and git on the host ( settings passed to container)

### 5. Access via devcontainer

- If there is a .devcontainer in the current directory, a pop-up will appear.
- Press the pop-up to start and attach the container. Alternatively, build from "Command Palette > Dev Containers: Rebuild…".
- Once the build is complete, execute inside the container.
