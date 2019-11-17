## REQUIREMENTS:

Gloss (cabal install gloss)

Note: `cabal install gloss` seems to fail on many linux distros due to missing C libraries. Sometimes required to install those before `cabal install gloss` succeeds.

## BUILDING EXECUTABLE:

	ghc -o main main.hs

## USAGE:

the main executable takes command-line arguments to display different animations:

Mac/Linux:

	./main        - Displays "circles"
	./main 1      - Displays "circles"
	./main 2      - Displays "circles2"
	./main 3      - Displays "circles3"
	./main 4      - Displays "circles4"

Windows:

	main.exe      - Displays "circles"
	main.exe 1    - Displays "circles"
	main.exe 2    - Displays "circles2"
	main.exe 3    - Displays "circles3"
	main.exe 4    - Displays "circles4"

### CONTROLS:

	Zoom: Page Up / Page Down
	Pan: Mouse / Arrow keys
	Exit: Esc
