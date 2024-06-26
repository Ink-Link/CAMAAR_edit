class QuestaosController < ApplicationController
  before_action :get_template
  before_action :set_questao, only: [:show, :edit, :update, :destroy]

  # GET /questaos
  def index
    @questaos = @template.questaos
  end

  # GET /questaos/1
  def show
  end

  # GET /questaos/new
  def new
    @questao = @template.questaos.build
    @tipos = Tipo.all
  end

  # GET /questaos/1/edit
  def edit
  end

  # POST /questaos
  def create
    @questao = @template.questaos.build(questao_params)

    if @questao.save
      redirect_to @questao, notice: 'Questao was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questaos/1
  def update
    if @questao.update(questao_params)
      redirect_to @template, notice: 'Questao was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questaos/1
  def destroy
    @questao.destroy
    redirect_to questaos_url, notice: 'Questao was successfully destroyed.'
  end

  private

    def get_template
      @template = Template.find(params[:template_id])
    end

    def set_questao
      @questao = @template.questaos.find(params[:id])
    end

    def questao_params
      params.require(:questao).permit(:pergunta, :template_id, :tipo_id, alternativas_attributes: [:id, :texto, :_destroy])
    end
end
