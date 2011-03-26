class SqlTemplatesController < ApplicationController
  # GET /sql_templates
  # GET /sql_templates.xml
  def index
    @sql_templates = SqlTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sql_templates }
    end
  end

  # GET /sql_templates/1
  # GET /sql_templates/1.xml
  def show
    @sql_template = SqlTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sql_template }
    end
  end

  # GET /sql_templates/new
  # GET /sql_templates/new.xml
  def new
    @sql_template = SqlTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sql_template }
    end
  end

  # GET /sql_templates/1/edit
  def edit
    @sql_template = SqlTemplate.find(params[:id])
  end

  # POST /sql_templates
  # POST /sql_templates.xml
  def create
    @sql_template = SqlTemplate.new(params[:sql_template])

    respond_to do |format|
      if @sql_template.save
        format.html { redirect_to(@sql_template, :notice => 'Sql template was successfully created.') }
        format.xml  { render :xml => @sql_template, :status => :created, :location => @sql_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sql_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sql_templates/1
  # PUT /sql_templates/1.xml
  def update
    @sql_template = SqlTemplate.find(params[:id])

    respond_to do |format|
      if @sql_template.update_attributes(params[:sql_template])
        format.html { redirect_to(@sql_template, :notice => 'Sql template was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sql_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sql_templates/1
  # DELETE /sql_templates/1.xml
  def destroy
    @sql_template = SqlTemplate.find(params[:id])
    @sql_template.destroy

    respond_to do |format|
      format.html { redirect_to(sql_templates_url) }
      format.xml  { head :ok }
    end
  end
end
