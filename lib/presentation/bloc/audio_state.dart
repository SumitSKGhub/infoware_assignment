class AudioState {
  final bool isPlaying;

  AudioState({required this.isPlaying});

  factory AudioState.initial() => AudioState(isPlaying: false);
}
