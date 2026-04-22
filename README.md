# University of Aveiro Thesis Template in Markdown

A thesis Markdown (Typst) template that complies with the University of Aveiro's
guidelines. A different direction from the Latex Template available at https://github.com/detiuaveiro/ua-thesis-template

We will try to keep up to date with thesis requirements but some discrepancies may exist.
Feel free to open issues and pull requests with new options, packages and fixes.

## Usage

Install Typst according to https://typst.app/open-source/

Edit the `main.typ` and `ua-thesis-template.typ` as adequate.

Compile the thesis with:
```
typst compile main.typ
```

You can live compile it with:
```
typst watch main.typ
```

## How to use the template

This is all great, but how can this repository be used as a starting point for
writing your own thesis?

In our opinion you have mostly three options:
- Download/clone the repository and copy *all* files to a directory of your
  desire, for instance to inside some special folder within you own thesis
  repository.  
  Notice that this will not allow you to easily keep up with this template
  should it change.
- Fork the repository to your own and work there. If you want to include it
  within your own thesis repository, you can use `git submodules` for this.
- Use `git subtree` to pull this repository to your main thesis repository and
  work directly there. Changes in your copy will be versioned by your main
  thesis repo, while you will still be able to pull new updates from here
  should they appear.

The last of these options mas be the most adquate, as it seems to be the most flexible and
easy-to-use alternative. Here follow the main commands you will need should you
choose to go along with this too.
```
$ mkdir mythesis
$ git init .
$ git commit --allow-empty -n -m "Initial commit."
$ git subtree add  --prefix document https://github.com/detiuaveiro/ua-thesis-template-typst.git master --squash;
$ git subtree pull --prefix document https://github.com/detiuaveiro/ua-thesis-template-typst.git master --squash;
```

- The first line will init a new repository for your thesis
- It will create an initial commit
- It will pull this repository for the first time to `document`
- The second is used for subsequent pulls.

The result should be a git repository for your thesis work. In the `$DESTDIR` (e.g. `document`)
you will have the document to edit. If you wish you can add a reference to another git repository
to track your own changes.

## Use as a template in github

Please check the [github instructions](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
to create your own repository using this as a template.

## Dependencies

- Typst
- An editor such as Visual Studio Code

## Relevant links

- The original Latex Template: https://github.com/detiuaveiro/ua-thesis-template
