# ubuntu-ttyd-python-zsh

A minimal Ubuntu-based Docker image that:

- Provides a browser-based terminal using [ttyd](https://github.com/tsl0922/ttyd)
- Runs with `zsh` and [Oh My Zsh](https://ohmyz.sh/)
- Includes Python 3 with `pip` and `venv` support
- Displays system info via `neofetch` on startup

Perfect for remote development, lightweight cloud terminals, or personal dashboards.

---

## 🚀 Features

- ✅ Ubuntu 22.04 base image
- ✅ Python 3, pip, and venv ready
- ✅ Zsh with Oh My Zsh preinstalled
- ✅ ttyd for web-based terminal access
- ✅ Neofetch on login
- ✅ Environment variable-based login for Railway or cloud deployment

---

## 🧑‍💻 Usage

### 🐳 Build and run locally

```bash
docker build -t ttyd-python-zsh .
docker run -e PORT=7681 -e USERNAME=admin -e PASSWORD=secret -p 7681:7681 ttyd-python-zsh
