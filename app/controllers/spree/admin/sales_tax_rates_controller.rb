module Spree
  module Admin
    class SalesTaxRatesController < ResourceController
      private

      def collection
        return @collection if @collection.present?

        params[:q] ||= {}
        
        @collection = super
        @search = @collection.ransack(params[:q])
        @collection = @search.result.includes(:country, :state).page(params[:page]).per(params[:per_page])
      end
    end
  end
end
