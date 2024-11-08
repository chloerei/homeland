module Admin
  class NodesController < Admin::ApplicationController
    before_action :set_node, only: %i[show edit update destroy]

    def index
      @nodes = Node.sorted
    end

    def show
    end

    def new
      @node = Node.new
    end

    def edit
    end

    def create
      @node = Node.new(params[:node].permit!)

      if @node.save
        redirect_to(admin_nodes_path, notice: t("views.admin.node_was_successfully_created"))
      else
        render action: "new"
      end
    end

    def update
      if @node.update(params[:node].permit!)
        redirect_to(admin_nodes_path, notice: t("views.admin.node_update_successfully"))
      else
        render action: "edit"
      end
    end

    def destroy
      @node.destroy
      redirect_to(admin_nodes_url)
    end

    private

    def set_node
      @node = Node.find(params[:id])
    end
  end
end
