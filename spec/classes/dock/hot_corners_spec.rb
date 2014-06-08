require 'spec_helper'

describe 'osx::dock::hot_corners' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  {'top_left' => 'Top Left', 'top_right' => 'Top Right', 'bottom_left' => 'Bottom Left', 'bottom_right' => 'Bottom Right'}.each_pair do |parameter_name, position|
    context "with #{parameter_name} parameter" do
      let(:params) { {parameter_name => 'Dashboard'} }

      it do
        should contain_osx__dock__hot_corner(position).with({
          :action => 'Dashboard'
        })
      end
    end
  end
end
