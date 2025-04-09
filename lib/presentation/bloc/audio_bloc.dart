import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _player = AudioPlayer();

  AudioBloc() : super(AudioState.initial()) {
    _player.playerStateStream.listen((playerState) {
      final playing = playerState.playing;
      add(UpdatePlayingStatus(playing)); // ⬅️ internal event
    });

    on<ToggleAudio>((event, emit) async {
      if (_player.playing) {
        await _player.pause();
      } else {
        if (_player.audioSource == null) {
          await _player.setAsset('lib/assets/Nira Ishq - Guri.mp3');
        }
        await _player.play();
      }
    });

    on<UpdatePlayingStatus>((event, emit) {
      emit(AudioState(isPlaying: event.isPlaying));
    });
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
