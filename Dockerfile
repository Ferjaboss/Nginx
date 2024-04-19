FROM nginx:1.21.1-alpine
COPY /Nginx/dist/angular/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]