# Dockerfile pour application aspnet
# Crée une alias "build" qui est égale à la platforme cible, dotnet SDK 8.0
FROM --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# Definit l'argument "TARGETARCH" (architecture cible)
#ARG TARGETARCH
# Definit le répértoire de travail, c'est dans ce répértoire que toutes les commandes RUN et COPY vont s'éxecuté
WORKDIR /source

# Copie csproj
COPY aspnetapp/*.csproj .
# Restore les dépendances et libraries en prenant en compte l'architecture "TARGETARCH" -a $TARGETARCH
RUN dotnet restore 

# Copie l'application et ses libraries
COPY aspnetapp/. .
# Publie l'application et ses libraries en prenant en compte TARGETARCH, sans restorer, et elle se colle dans le répértoire "/app" -a $TARGETARCH
RUN dotnet publish -c Release -o /app


# Utilise l'image dotnet aspnet 8.0 de Microsoft
FROM mcr.microsoft.com/dotnet/aspnet:8.0
# Utilise le port 8080
EXPOSE 8080
# Redefinit le répértoire de travail à "/app"
WORKDIR /app
# Copie le résultat du build dans le répétoire "/app"
COPY --from=build /app .
# Set the user to the variable "APP_UID" which is an environment variable
#USER $APP_UID
# Define the command that is executed when the container starts
ENTRYPOINT ["./aspnetapp"]
