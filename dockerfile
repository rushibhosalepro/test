FROM oven/bun:1

WORKDIR /app

# Copy root manifests
COPY package.json turbo.json ./

# Copy workspace manifests for dependency resolution
COPY apps/web/package.json apps/web/
COPY apps/docs/package.json apps/docs/
COPY packages/ui/package.json packages/ui/
COPY packages/typescript-config/package.json packages/typescript-config/
COPY packages/eslint-config/package.json packages/eslint-config/

RUN bun install

COPY . .

EXPOSE 3000
EXPOSE 3001

CMD ["bun", "run", "dev"]
