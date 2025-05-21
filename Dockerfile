# Dockerfile
FROM ruby:3.4.4

# Instala dependencias del sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Establece el directorio de trabajo
WORKDIR /app

# Copia Gemfile primero para aprovechar el cache de Docker
COPY Gemfile Gemfile.lock ./

# Instala las gemas
RUN gem install bundler && bundle install

# Copia el resto del proyecto
COPY . .

# Expone el puerto (opcional)
EXPOSE 3000

# Comando por defecto
CMD ["rails", "server", "-b", "0.0.0.0"]