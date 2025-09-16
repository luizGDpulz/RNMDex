/// Debounce utility for Rick and Morty Pokedex
import 'dart:async';
typedef VoidCallback = void Function();

class Debounce {
	final int milliseconds;
	Timer? _timer;

	Debounce({required this.milliseconds});

	/// Runs the provided action after the debounce duration.
	void run(VoidCallback action) {
		_timer?.cancel();
		_timer = Timer(Duration(milliseconds: milliseconds), action);
	}

	void dispose() {
		_timer?.cancel();
	}
}
