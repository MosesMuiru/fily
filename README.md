# Fily

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

# dependecies
      {:absinthe, "~> 1.7"},
        ` used for creating graphql `
      {:waffle, "~> 1.1"},
            ` easy to use, and offers a flexible customization on files to you can upload`
      {:oban, "~> 2.17"},
      {:waffle_ecto, "~> 0.0.12"}

## Thought process
    # design
    1. start with database 
    2. schema creation
    3. waffle schema (` this contains the valid files `)
    4. graphql
        schema
        queries
        resolvers

# user process
    The user should be able to consume graphql 
    The user should be able to upload the files using the api
    The api should give relevant feedback
    
## the api only allows the following exetentions of files
    (.png .jpg .jpeg .pdf .txt)      

## endpoints

    ### /api
    ### /api/graphiql

### sample queries
get all uploads
```
    query {
	getAllUploads{
		id
		fileName
		theFile{
			fileName
			updatedAt
		}
	}
}
```

uploading  a file

```
    mutation{
	uploadFile(fileName: "name", theFile: "names.txt"){

		message
		
	}
}
```

### link to the uploads
    /priv/uploads
