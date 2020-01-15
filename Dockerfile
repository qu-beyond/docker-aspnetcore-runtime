FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.1-bionic

# set noninteractive installation and install required libraries
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    libicu-dev \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# Install ASP.NET Core
#https://download.visualstudio.microsoft.com/download/pr/e716faa4-345c-45a7-bd1f-860cdf422b75/fa8e57167f3bd4bf20b8b60992cf184f/aspnetcore-runtime-2.2.8-linux-x64.tar.gz
ENV ASPNETCORE_VERSION 2.2.8

RUN curl -SL --output aspnetcore.tar.gz https://dotnetcli.azureedge.net/dotnet/aspnetcore/Runtime/$ASPNETCORE_VERSION/aspnetcore-runtime-$ASPNETCORE_VERSION-linux-x64.tar.gz \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf aspnetcore.tar.gz -C /usr/share/dotnet \
    && rm aspnetcore.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
