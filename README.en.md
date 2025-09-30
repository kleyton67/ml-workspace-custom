# ML-Workspace FORK for Python Developers
## Original Purpose
The ML workspace is an all-in-one web-based IDE specialized for machine learning and data science. It is simple to deploy and gets you started within minutes to productively build ML solutions on your own machines. This workspace is the ultimate tool for developers, preloaded with a variety of popular data science libraries (e.g., Tensorflow, PyTorch, Keras, Sklearn) and dev tools (e.g., Jupyter, VS Code, Tensorboard) perfectly configured, optimized, and integrated.

## Purpose of this repo
This repo uses the base of ML-Workspace to generate a ready-to-use image for Python development. 
The changes compared to the original purpose are to update the packages, let the build be done via Docker Compose, use official CUDA images, and reduce the number of packages in the base environment.

## How to use?
To use this image, you can simply use Docker Compose.
```bash
docker compose up -d 
```

When running the compose, check the necessary volumes inside the docker-compose file so you don't delete anything unwanted.
When running, create a hash to access the page and put it in the environment variable: AUTHENTICATE_VIA_JUPYTER .

I recommend using Conda and the workspace in a separate environment to reduce the pod size, for this just copy the Conda and workspace folders from the image and place them in a location you have space.
