module JobsHelper

def add_asset_link(name)
    link_to_function name do |job|
      job.insert_html :bottom, :assets, :partial => 'asset', :object => Asset.new
    end
  end
end
