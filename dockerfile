FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App

COPY . .

RUN dotnet restore ikt206g24v-05.sln --verbosity detailed
RUN dotnet publish ikt206g24v-05.sln -c Release -o out


FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT [ "dotnet", "Example.dll" ]