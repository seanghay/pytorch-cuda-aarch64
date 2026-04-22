FROM nvidia/cuda:13.2.0-cudnn-runtime-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  python3 python3-pip python3-venv build-essential ca-certificates curl wget zip \
  && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN --mount=type=cache,target=/root/.cache/pip \
  pip install \
  numpy \
  torch \
  torchvision \
  tqdm \
  Pillow \
  matplotlib \
  timm \
  opencv-python-headless \
  click \
  python-multipart \
  starlette \
  uvicorn \
  gunicorn \
  rapidfuzz \
  https://huggingface.co/Jay0515/onnxruntime-gpu-aarch64-cuda13-sm121/resolve/main/onnxruntime_gpu-1.25.0-cp312-cp312-linux_aarch64.whl