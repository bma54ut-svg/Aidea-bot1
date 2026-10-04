FROM node:22-bookworm-slim
WORKDIR /app
RUN corepack enable
COPY bot.zip /tmp/bot.zip
RUN unzip -q /tmp/bot.zip -d /app && rm /tmp/bot.zip
RUN pnpm install --frozen-lockfile
ENV NODE_ENV=production
EXPOSE 3000
CMD ["pnpm", "--filter", "@workspace/api-server", "start"]
