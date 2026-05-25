FROM node:20-slim
RUN apt-get update && apt-get install -y curl git python3 make g++ && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
ENV PATH="/root/.local/bin:$PATH"
ENV HERMES_HOME="/root/.hermes"
CMD ["sh", "-c", "mkdir -p ~/.hermes && echo 'gateway:\n  telegram:\n    enabled: true' > ~/.hermes/config.yaml && hermes gateway start"]
