# Use the official Rust image as the base
FROM rust

# Install dependencies (if needed, such as curl or additional tools)
RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install Rustlings globally
RUN cargo install rustlings
RUN rustup component add clippy --toolchain 1.82.0-aarch64-unknown-linux-gnu

# Copy the Rustlings exercises folder into the container (if applicable)
# Uncomment and modify the next line if you have Rustlings locally
# COPY ./rustlings /usr/src/app/rustlings

# Expose a shell to work interactively
CMD ["/bin/bash"]