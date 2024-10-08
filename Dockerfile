# Build Stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
# 👇 WORKDIR /src creates a folder named src in the container and goes to it
WORKDIR /src
# restore Copy the .csproj to the "src/TestAPI/" folder of the container
COPY ["./TestAPI.csproj", "TestAPI/"]
RUN dotnet restore "TestAPI/TestAPI.csproj"
COPY ["./","TestAPI"]
WORKDIR /src/TestAPI
RUN dotnet build "TestAPI.csproj" -c Release -o /app/build

# Publish Stage
FROM build as publish
RUN dotnet publish "TestAPI.csproj" -c Release -o /app/publish


# Run Stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS build
ENV ASPNETCORE_HTTP_PORTS=5001
EXPOSE 5001
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet","TestAPI.dll"]