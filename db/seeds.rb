languages = [
  {
    name: "C (gcc 8.2.0)",
    source_file: "main.c",
    compile_cmd: "/usr/local/gcc-8.2.0/bin/gcc -Wall -pedantic -pedantic-errors -std=c11 -lm main.c",
    run_cmd: "./a.out"
  },


  {
    name: "Text (plain text)",
    source_file: "source.txt",
    run_cmd: "/bin/cat source.txt"
  }
]

if Language.count > 0 && ENV["DISABLE_DATABASE_ENVIRONMENT_CHECK"] == "1"
  ActiveRecord::Base.transaction do
    Language.delete_all
    ActiveRecord::Base.connection.reset_pk_sequence!('languages')
  end
end

if Language.count == 0
  ActiveRecord::Base.transaction do
    Language.create(languages)
  end
end
