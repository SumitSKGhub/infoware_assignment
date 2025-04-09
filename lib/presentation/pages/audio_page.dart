import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/presentation/bloc/audio_bloc.dart';
import 'package:infoware/presentation/bloc/audio_event.dart';
import 'package:infoware/presentation/bloc/audio_state.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AudioBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Audio Player'),
          centerTitle: true,
          backgroundColor: Color(0xFFFAE1EB),
        ),
        backgroundColor: Color(0xFFFFEBEB),
        body: Center(
          child: BlocBuilder<AudioBloc, AudioState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 80,
                    icon: Icon(
                      state.isPlaying ? Icons.pause_circle : Icons.play_circle,
                    ),
                    onPressed: () {
                      context.read<AudioBloc>().add(ToggleAudio());
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Song is ${state.isPlaying ? 'playing' : 'paused'}'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
