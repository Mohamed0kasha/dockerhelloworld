# First Stage - Base Image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source

# Copy csproj files and restore dependencies
COPY *.csproj .
RUN dotnet restore

# Copy and publish application files
COPY . .
RUN dotnet publish -c release -o /app

# FINAL Stage
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .
#entry
#entry32
ENTRYPOINT [ "dotnet", "helloworldapp.dll" ]