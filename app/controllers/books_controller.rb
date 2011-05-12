class BooksController < ApplicationController
  def index
    @publications = Publication.all
  end

  def show
    unless params[:title].blank?
      @publication = Publication.find_by_title params[:title]
    else
      @publication = Publication.find params[:id]
    end
  end

  def new
    @publication = Publication.new
    @publication.editions.build
  end

  def create
    pj = params[:publication].delete :publication_json
    pub_hash = ActiveSupport::JSON.decode pj
    pub_hash.merge! params[:publication]

    @publication = Publication.new pub_hash
    if @publication.save
      redirect_to @publication, :notice => t('publication.flash.created_successfully')
    else
      render :new
    end
  end

  def edit
    @publication = Publication.find params[:id]
  end

  def update
    @publication = Publication.find params[:id]
    if @publication.update_attributes params[:publication]
      redirect_to @publication, :notice => t('publication.flash.edited_successfully')
    else
      render :edit
    end
  end

  def destroy
    Publication.find(params[:id]).destroy
    redirect_to root_path, :notice => t('publication.flash.deleted_successully')
  end
end
