#!/bin/bash

### Permissions pour exécution des scripts

chmod +x user_part.sh && chmod +x root_part.sh &&

### Lancement des scripts

sudo ./root_part.sh && ./user_part.sh
