abstract class AudioEvent {}

class PlayAudio extends AudioEvent {}

class PauseAudio extends AudioEvent {}

class ToggleAudio extends AudioEvent {}

class UpdatePlayingStatus extends AudioEvent {
  final bool isPlaying;
  UpdatePlayingStatus(this.isPlaying);
}
