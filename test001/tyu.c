#include <stdio.h>
#include <SDL2/SDL.h>

int main(int argc, char *argv[]) {
    // Initialisation de SDL
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        printf("Erreur d'initialisation de SDL: %s\n", SDL_GetError());
        return 1;
    }

    // Obtenir le nombre d'écrans disponibles
    int num_displays = SDL_GetNumVideoDisplays();
    if (num_displays < 1) {
        printf("Erreur: Aucun écran détecté! %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }

    printf("Nombre d'écrans détectés: %d\n\n", num_displays);

    // Parcourir chaque écran et afficher ses caractéristiques
    for (int i = 0; i < num_displays; i++) {
        SDL_DisplayMode mode;
        if (SDL_GetCurrentDisplayMode(i, &mode) != 0) {
            printf("Impossible de récupérer les informations de l'écran %d: %s\n", i, SDL_GetError());
            continue;
        }

        printf("Écran %d:\n", i + 1);
        printf("  Résolution: %dx%d\n", mode.w, mode.h);
        printf("  Fréquence de rafraîchissement: %d Hz\n", mode.refresh_rate);
        printf("  Format du pixel: %s\n\n", SDL_GetPixelFormatName(mode.format));
    }

    // Nettoyage et sortie
    SDL_Quit();
    return 0;
}

