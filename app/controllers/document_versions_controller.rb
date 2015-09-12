class DocumentVersionsController < ApplicationController
  before_action :set_document_version, only: [:show, :edit, :update, :destroy]

  # GET /document_versions
  # GET /document_versions.json
  def index
    @document_versions = DocumentVersion.all
  end

  # GET /document_versions/1
  # GET /document_versions/1.json
  def show
  end

  # GET /document_versions/new
  def new
    @document_version = DocumentVersion.new
  end

  # GET /document_versions/1/edit
  def edit
  end

  # POST /document_versions
  # POST /document_versions.json
  def create
    @document_version = DocumentVersion.new(document_version_params)

    respond_to do |format|
      if @document_version.save
        format.html { redirect_to @document_version, notice: 'Document version was successfully created.' }
        format.json { render :show, status: :created, location: @document_version }
      else
        format.html { render :new }
        format.json { render json: @document_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_versions/1
  # PATCH/PUT /document_versions/1.json
  def update
    respond_to do |format|
      if @document_version.update(document_version_params)
        format.html { redirect_to @document_version, notice: 'Document version was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_version }
      else
        format.html { render :edit }
        format.json { render json: @document_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_versions/1
  # DELETE /document_versions/1.json
  def destroy
    @document_version.destroy
    respond_to do |format|
      format.html { redirect_to document_versions_url, notice: 'Document version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_version
      @document_version = DocumentVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_version_params
      params[:document_version]
    end
end
