$ErrorActionPreference = "Stop"

$VENV_NAME = "llm-env-model-examen"

if (-not (Test-Path ".\$VENV_NAME")) {
    python -m venv $VENV_NAME
}

& ".\$VENV_NAME\Scripts\python.exe" -m pip install --upgrade pip

& ".\$VENV_NAME\Scripts\python.exe" -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126

& ".\$VENV_NAME\Scripts\python.exe" -m pip install -r .\requirements.txt

& ".\$VENV_NAME\Scripts\python.exe" -m ipykernel install --user --name $VENV_NAME --display-name "Python ($VENV_NAME)"

New-Item -ItemType Directory -Force -Path .\data | Out-Null
New-Item -ItemType Directory -Force -Path ".\data\expected results" | Out-Null
New-Item -ItemType Directory -Force -Path .\results | Out-Null

Write-Host ""
Write-Host "Setup complete."
Write-Host "Kernel registered as: Python ($VENV_NAME)"