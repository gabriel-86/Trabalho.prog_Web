class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
      if params[:search].present?
        @clientes = Cliente.where("nome LIKE ?", "%#{params[:search]}%")
      else
        @clientes = Cliente.all
      end
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_path, status: :see_other, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def exportar_csv
    @clientes = Cliente.all
    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["ID", "Nome", "Email", "Telefone"]
      @clientes.each do |cliente|
        csv << [cliente.id, cliente.nome, cliente.email, cliente.telefone]
      end
    end
    send_data csv_data, filename: "clientes.csv"
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :email, :telefone)
    end
end
