" vim-rails only provides highlighting for rspec in Rails projects.
" I wanted to extract this into a ftdetect+ftplugin combo, but applying the
" syntax command just doesn't seem to work without an autocommand.
autocmd BufNewFile,BufRead *_spec.rb syntax keyword rubyRspec describe context it its specify shared_context shared_examples_for it_should_behave_like it_behaves_like before after around subject fixtures controller_name helper_name scenario feature background violated pending expect double mock mock_model stub_model
highlight def link rubyRspec Function
