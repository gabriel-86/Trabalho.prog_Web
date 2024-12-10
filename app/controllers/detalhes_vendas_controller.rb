class DetalhesVendasController < ApplicationController
  before_action :set_detalhes_venda, only: %i[ show edit update destroy ]

  # GET /detalhes_vendas or /detalhes_vendas.json
  def index
    @detalhes_vendas = DetalhesVenda.all
  end

  # GET /detalhes_vendas/1 or /detalhes_vendas/1.json
  def show
  end

  # GET /detalhes_vendas/new
  def new
    @detalhes_venda = DetalhesVenda.new
  end

  # GET /detalhes_vendas/1/edit
  def edit
  end

  # POST /detalhes_vendas or /detalhes_vendas.json
  def create
    @detalhes_venda = DetalhesVenda.new(detalhes_venda_params)

    respond_to do |format|
      if @detalhes_venda.save
        format.html { redirect_to @detalhes_venda, notice: "Detalhes venda was successfully created." }
        format.json { render :show, status: :created, location: @detalhes_venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detalhes_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalhes_vendas/1 or /detalhes_vendas/1.json
  def update
    respond_to do |format|
      if @detalhes_venda.update(detalhes_venda_params)
        format.html { redirect_to @detalhes_venda, notice: "Detalhes venda was successfully updated." }
        format.json { render :show, status: :ok, location: @detalhes_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detalhes_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalhes_vendas/1 or /detalhes_vendas/1.json
  def destroy
    @detalhes_venda.destroy!

    respond_to do |format|
      format.html { redirect_to detalhes_vendas_path, status: :see_other, notice: "Detalhes venda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalhes_venda
      @detalhes_venda = DetalhesVenda.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def detalhes_venda_params
      params.expect(detalhes_venda: [ :venda_id, :produto_id, :quantidade, :subtotal ])
    end
end
