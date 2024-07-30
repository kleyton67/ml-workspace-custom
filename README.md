<h1 align="center">
    <a href="https://github.com/anu7n/ml-workspace-custom" title="ML Workspace Customized Home">
    <img width=50% alt="" src="https://github.com/anu7n/ml-workspace-custom/blob/main/resources/branding/logo.png"> </a>
    <br>
</h1>

<p align="center">
    <strong>Customized all-in-one web-based development environment for machine learning</strong>
</p>

The ML workspace is an all-in-one web-based IDE specialized for machine learning and data science. It is simple to deploy and gets you started within minutes to productively build ML solutions on your own machines. This workspace is the ultimate tool for developers, preloaded with a variety of popular data science libraries (e.g., Tensorflow, PyTorch, Keras, Sklearn) and dev tools (e.g., Jupyter, VS Code, Tensorboard) perfectly configured, optimized, and integrated.

🛠 Customizations for BALab (Business Analytics Lab)
- **Self-maintained CUDA version:** Due to the original version not being updated for a long time, this customization ensures that the CUDA version is actively maintained and frequently updated, ensuring compatibility with the latest developments in machine learning.
- **Commitment to updates:** Regular updates to the CUDA version are provided to keep the workspace in sync with the latest tools and technologies.
- **Minimal versions of workspace:** To avoid conflicts related to package dependencies between recent TensorFlow and PyTorch versions, only minimal versions are pre-installed. You can install the latest versions of TensorFlow and PyTorch manually within a virtual environment and set it up as a new kernel.

<br>

We strive to keep everything as similar as possible to the original version inside the repository, except for the customized figures/logos in the resources for our lab needs and other updates related to the CUDA version. **For more information and to see the original version, please visit: [ml-tooling/ml-workspace.](https://github.com/ml-tooling/ml-workspace)**

<br>

## Highlights

- 💫&nbsp; Jupyter, JupyterLab, and Visual Studio Code web-based IDEs.
- 🗃&nbsp; Pre-installed with many popular data science libraries & tools.
- 🖥&nbsp; Full Linux desktop GUI accessible via web browser.
- 🔀&nbsp; Seamless Git integration optimized for notebooks.
- 📈&nbsp; Integrated hardware & training monitoring via Tensorboard & Netdata.
- 🚪&nbsp; Access from anywhere via Web, SSH, or VNC under a single port.
- 🎛&nbsp; Usable as remote kernel (Jupyter) or remote machine (VS Code) via SSH.
- 🐳&nbsp; Easy to deploy on Mac, Linux, and Windows via Docker.

***all the features detail could be seen at [ml-tooling/ml-workspace#features](https://github.com/ml-tooling/ml-workspace#features)***

<br>

## Getting Started (Start single instance)

### CUDA 12.5

### Prerequisites

- **CUDA Version 12.5** need to be installed on your machine (tested well on nvidia driver Version: 555.99)
- The workspace requires **Docker** to be installed on your machine ([📖 Installation Guide](https://docs.docker.com/install/#supported-platforms)).

### Deployment

Deploying a single workspace instance is as simple as:

```bash
docker run -p 8080:8080 greathopes/custom-workspace:12-5
```
> *we use image tags as the label for the supported CUDA version (ex:12-5 for CUDA 12.5)*

Voilà, that was easy! Now, Docker will pull the latest workspace image to your machine. This may take a few minutes, depending on your internet speed. Once the workspace is started, you can access it via http://localhost:8080.

> _If started on another machine or with a different port, make sure to use the machine's IP/DNS and/or the exposed port._

To deploy a single instance for productive usage, we recommend to apply at least the following options:

```bash
docker run -d \
    -p 8080:8080 \
    --name "custom-workspace" \
    -v "${PWD}:/workspace" \
    --env AUTHENTICATE_VIA_JUPYTER="mytoken" \
    --shm-size 512m \
    --restart always \
    greathopes/custom-workspace:12-5
```

This command runs the container in background (`-d`), mounts your current working directory into the `/workspace` folder (`-v`), secures the workspace via a provided token (`--env AUTHENTICATE_VIA_JUPYTER`), provides 512MB of shared memory (`--shm-size`) to prevent unexpected crashes (see [known issues section](https://github.com/ml-tooling/ml-workspace#known-issues)), and keeps the container running even on system restarts (`--restart always`). You can find additional options for docker run [here](https://docs.docker.com/engine/reference/commandline/run/) and workspace configuration options in [the following section](https://github.com/ml-tooling/ml-workspace#Configuration).


