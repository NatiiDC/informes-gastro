SimpleForm.setup do |config|

  config.wrappers :standar, tag: 'div', class: 'form-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'col-md-4 control-label'

    b.wrapper tag: 'div' do |ba|
      ba.use :input, class: 'form-control'
    ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

end
