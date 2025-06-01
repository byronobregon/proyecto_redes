class ServersController < ApplicationController
  before_action :set_server, only: %i[ show edit update destroy ]

  def index
    @servers = Server.all
  end

  def show; end

  def new
    @server = Server.new
  end

  def edit; end

  def create
    @server = Server.new(server_params)

    respond_to do |format|
      if @server.save
        format.html { redirect_to servers_path, notice: "Servidor Creado" }
        format.json { render :show, status: :created, location: @server }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @server.update(server_params)
        format.html { redirect_to servers_path, notice: "Servidor Actualizado" }
        format.json { render :show, status: :ok, location: @server }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @server.destroy!

    respond_to do |format|
      format.html { redirect_to servers_path, status: :see_other, notice: "Servidor Eliminado" }
      format.json { head :no_content }
    end
  end

  private

  def set_server
    @server = Server.find(params.expect(:id))
  end

  def server_params
    params.expect(server: %i[ ip_address name authentication_token ])
  end
end
