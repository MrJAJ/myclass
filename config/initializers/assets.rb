Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile << Proc.new do |path|
    if path =~ /.(css|js|png|jpg|gif|svg|eot|ttf|woff|swf|json)\z/
        path
    else
        nil
    end
end 
