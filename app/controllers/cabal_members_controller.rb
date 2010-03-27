class CabalMembersController < ApplicationController
  before_filter :authenticate_user!

  def set_positions
    params[:data].each do |data|
      attrs = data.last
      CabalMember.find_by_id(attrs[:id].delete 'cabal_member_').
        update_attribute :position, attrs[:idx]
    end
    render :text => ''
  end

  def index
    @cabal_members = CabalMember.order('position ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cabal_members }
    end
  end

  def show
    @cabal_member = CabalMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cabal_member }
    end
  end

  def new
    @cabal_member = CabalMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cabal_member }
    end
  end

  def edit
    @cabal_member = CabalMember.find(params[:id])
  end

  def create
    @cabal_member = CabalMember.new(params[:cabal_member])

    respond_to do |format|
      if @cabal_member.save
        format.html { redirect_to(@cabal_member, :notice => 'CabalMember was successfully created.') }
        format.xml  { render :xml => @cabal_member, :status => :created, :location => @cabal_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cabal_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @cabal_member = CabalMember.find(params[:id])

    respond_to do |format|
      if @cabal_member.update_attributes(params[:cabal_member])
        format.html { redirect_to(cabal_members_url, :notice => 'CabalMember was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cabal_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cabal_member = CabalMember.find(params[:id])
    @cabal_member.destroy

    respond_to do |format|
      format.html { redirect_to(cabal_members_url) }
      format.xml  { head :ok }
    end
  end
end
