FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["WebApiForecast/WebApiForecast.csproj", "WebApiForecast/"]

RUN dotnet restore "WebApiForecast/WebApiForecast.csproj"
COPY . .
WORKDIR "/src/WebApiForecast"
RUN dotnet build "WebApiForecast.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebApiForecast.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebApiForecast.dll"]