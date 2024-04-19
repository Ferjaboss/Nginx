FROM nginx:1.21.1-alpine
COPY --from=build /app/dist/angular /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]