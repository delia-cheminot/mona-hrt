# --- BEGIN THIRD-PARTY CODE NOTICE ---
# The snippet below is taken directly from the Flutter Version Manager project,
# which is licensed under the MIT license. Below is a copy of that license
# and it's notice. The modificatiions include changing the build stage;
# stripping out (rather unnecessary for our use) comments, and changing the
# source that it's copied from. Source file: FVM/.docker/Dockerfile
# 
# MIT License
# 
# Copyright (c) 2019 Leo Farias
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# --- END THIRD-PARTY CODE NOTICE ---
# --- BEGIN THIRD-PARTY CODE ---
FROM docker.io/library/dart:stable AS fvm

WORKDIR /app
ADD https://github.com/leoafarias/fvm.git#v4.1.0 .
RUN dart pub get --no-precompile
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /out
RUN dart compile exe bin/main.dart -o /out/fvm
RUN /out/fvm --version
# --- END THIRD-PARTY CODE ---

FROM docker.io/library/fedora:latest AS development

# Install Android-specific dependencies.
RUN dnf in java-25-openjdk-devel java-25-openjdk java-25-openjdk-src \
    --assumeyes
COPY --from=docker.io/runmymind/docker-android-sdk:latest \
    /opt/android-sdk-linux /opt/android-sdk-linux
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_SDK_ROOT=/opt/android-sdk-linux

# Install Linux-specific dependencies.
RUN dnf in cmake clang ninja gtk3-devel glib2-devel --assumeyes

# Finalise.
COPY --from=fvm /out/fvm /usr/bin/fvm
USER vscode
