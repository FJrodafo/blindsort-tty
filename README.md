# BlindSort

A simple terminal-based number sorting game!

## Index

1. [Introduction](#introduction)
2. [Attribution](#attribution)
3. [Project Structure](#project-structure)
4. [How to play](#how-to-play)
5. [Download the game](#download-the-game)
6. [Install dependencies](#install-dependencies)
7. [Install it globally](#install-it-globally)
8. [Install it locally](#install-it-locally)
9. [Testing](#testing)
10. [Run it!](#run-it)
11. [Additional commands](#additional-commands)
12. [Screenshots](#screenshots)

## Introduction

A simple terminal-based number sorting game, written in shell scripting, powered by Bash, designed by [m3tozz](https://github.com/m3tozz)!

## Attribution

Forked from [m3tozz/blindsort-tty](https://github.com/m3tozz/blindsort-tty)

Game originally designed by [m3tozz](https://github.com/m3tozz)

## Project Structure

<details>
<summary>Click me</summary>

```
Game/
├── game.sh
└── Makefile
```
</details>

## How to play

- Choose the number of positions (e.g., 6).  
- Random numbers will be given to you.  
- Place each number into an empty position.  
- When all positions are filled, the game checks if the numbers are sorted in ascending order.  
- If sorted, you win; if not, you lose.

## Download the game

Open your directory where you save your repositories and clone it with the following command:

```shell
# From GitHub
git clone https://github.com/FJrodafo/BlindSort.git
```

## Install dependencies

This game requires the following dependencies to be able to install/uninstall it via Makefile (In this case, they will be installed for a Linux Debian system via apt):

```shell
sudo apt update
sudo apt install -y build-essential coreutils
```

## Install it globally

Install the game globally with the following command (Make sure you are in the `Game` directory):

```shell
sudo make install
```

As you might guess, you can uninstall the game with the following command (Make sure you are in the `Game` directory):

```shell
sudo make uninstall  # I'll be sad if you uninstall it 🥲
```

## Install it locally

The advantages of installing the game locally are that you wouldn't need administrator privileges to install it; the disadvantage is that you would need to configure some extra files for it to work correctly, but don't worry because it's all documented below...

First we need to make sure that the `~/.local/bin` directory exists with the following command:

```shell
mkdir -p "$HOME/.local/bin"
```

Now we need to add the directory path to `$PATH`. To do this, we add the following line of code to our `.bashrc` file with the following command:

```shell
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

If we don't want to permanently add that path to $PATH, we could run the following command to add the path temporarily in the current session, that is, the terminal in which you will run the following command (Simply ignore the following command if you already executed the one in the previous step):

```shell
export PATH="$HOME/.local/bin:$PATH"
```

Now we can finally install the game locally with the following command (Make sure you are in the `Game` directory):

```shell
make install PREFIX="$HOME/.local"
```

As you might guess, you can uninstall the game with the following command (Make sure you are in the `Game` directory):

```shell
make uninstall PREFIX="$HOME/.local"  # Please do not uninstall it 🥲
```

## Testing

If you've made it this far and want to learn a little more about testing your installation, check out the following commands:

* This command verifies that the installation was completed successfully.
    ```shell
    command -v blindsort
    ```
* The second one verifies that you uninstalled the game correctly, which I hope you haven't done...
    ```shell
    test ! -f "/usr/local/bin/blindsort"  # Globally
    ```
    ```shell
    test ! -f "$HOME/.local/bin/blindsort"  # Locally
    ```

## Run it!

Finally, if you have installed the game, either globally or locally, you can now run the following command to start a game!

```shell
blindsort
```

## Additional commands

To check the current version of the game, run the following command:

```shell
blindsort --version
```

If you need help, run the following command:

```shell
blindsort --help
```

A reduced version of the previous commands exists:

```shell
blindsort -v
blindsort -h
```

## Screenshots

![Example](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/Assets/Example.png "Example")

![Loser](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/Assets/Loser.png "Loser")

![Winner](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/Assets/Winner.png "Winner")