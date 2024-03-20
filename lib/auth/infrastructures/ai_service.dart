import 'dart:io';

import 'package:dio/dio.dart';

class ModelResponse {
  final String? object;
  final List<Model>? data;

  const ModelResponse({
    this.object,
    this.data,
  });

  ModelResponse copy({
    String? object,
    List<Model>? data,
  }) {
    return ModelResponse(
      object: object ?? this.object,
      data: data ?? this.data,
    );
  }

  factory ModelResponse.from(Map<String, dynamic> source) {
    final object = source["object"];
    final data = source["data"];
    return ModelResponse(
      object: object is String ? object : null,
      data: data is List ? data.map((e) => Model.from(e)).toList() : [],
    );
  }

  Map<String, dynamic> get source {
    return {
      "object": object,
      "data": data?.map((e) => e.source),
    };
  }
}

class Model {
  final String? id;
  final String? object;
  final int? created;
  final String? ownedBy;

  const Model({
    this.id,
    this.object,
    this.created,
    this.ownedBy,
  });

  Model copy({
    String? id,
    String? object,
    int? created,
    String? ownedBy,
  }) {
    return Model(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      ownedBy: ownedBy ?? this.ownedBy,
    );
  }

  factory Model.from(Map<String, dynamic> source) {
    final id = source["id"];
    final object = source["object"];
    final created = source["created"];
    final ownedBy = source["owned_by"];
    return Model(
      id: id is String ? id : null,
      object: object is String ? object : null,
      created: created is int ? created : null,
      ownedBy: ownedBy is String ? ownedBy : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "id": id,
      "object": object,
      "created": created,
      "owned_by": ownedBy,
    };
  }
}

class CompletionResponse {
  final String? id;
  final String? object;
  final int? created;
  final String? model;
  final List<CompletionChoice>? choices;
  final CompletionUsage? usage;
  final String? systemFingerprint;

  const CompletionResponse({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
    this.systemFingerprint,
  });

  CompletionResponse copy({
    String? id,
    String? object,
    int? created,
    String? model,
    List<CompletionChoice>? choices,
    CompletionUsage? usage,
    String? systemFingerprint,
  }) {
    return CompletionResponse(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
      systemFingerprint: systemFingerprint ?? this.systemFingerprint,
    );
  }

  factory CompletionResponse.from(Map<String, dynamic> source) {
    final id = source["id"];
    final object = source["object"];
    final created = source["created"];
    final model = source["model"];
    final choices = source["choices"];
    final usage = source["usage"];
    final systemFingerprint = source["system_fingerprint"];
    return CompletionResponse(
      id: id is String ? id : null,
      object: object is String ? object : null,
      created: created is int ? created : null,
      model: model is String ? model : null,
      choices: choices is List
          ? choices.map((i) => CompletionChoice.from(i)).toList()
          : null,
      usage: usage is Map<String, dynamic> ? CompletionUsage.from(usage) : null,
      systemFingerprint: systemFingerprint is String ? systemFingerprint : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "id": id,
      "object": object,
      "created": created,
      "model": model,
      "choices": choices?.map((i) => i.source),
      "usage": usage?.source,
      "system_fingerprint": systemFingerprint,
    };
  }

  @override
  String toString() {
    return "Completion(${source.toString().replaceAll("{", "").replaceAll("}", "")})";
  }
}

class CompletionChoice {
  final int? index;
  final CompletionMessage? message;
  final dynamic logprobs;
  final String? finishReason;

  const CompletionChoice({
    this.index,
    this.message,
    this.logprobs,
    this.finishReason,
  });

  CompletionChoice copy({
    int? index,
    CompletionMessage? message,
    dynamic logprobs,
    String? finishReason,
  }) {
    return CompletionChoice(
      index: index ?? this.index,
      message: message ?? this.message,
      logprobs: logprobs ?? this.logprobs,
      finishReason: finishReason ?? this.finishReason,
    );
  }

  factory CompletionChoice.from(Map<String, dynamic> source) {
    final index = source["index"];
    final message = source["message"];
    final logprobs = source["logprobs"];
    final finishReason = source["finish_reason"];
    return CompletionChoice(
      index: index is int ? index : null,
      message: message is Map<String, dynamic>
          ? CompletionMessage.from(message)
          : null,
      logprobs: logprobs,
      finishReason: finishReason is String ? finishReason : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "index": index,
      "message": message?.source,
      "logprobs": logprobs,
      "finish_reason": finishReason,
    };
  }

  @override
  String toString() {
    return "Choice(${source.toString().replaceAll("{", "").replaceAll("}", "")})";
  }
}

class CompletionMessage {
  final String? role;
  final String? content;

  const CompletionMessage({
    this.role,
    this.content,
  });

  CompletionMessage copy({
    String? role,
    String? content,
  }) {
    return CompletionMessage(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  factory CompletionMessage.from(Map<String, dynamic> source) {
    final role = source["role"];
    final content = source["content"];
    return CompletionMessage(
      role: role is String ? role : null,
      content: content is String ? content : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "role": role,
      "content": content,
    };
  }

  @override
  String toString() {
    return "Message(${source.toString().replaceAll("{", "").replaceAll("}", "")})";
  }
}

class CompletionUsage {
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;

  const CompletionUsage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
  });

  CompletionUsage copy({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return CompletionUsage(
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  factory CompletionUsage.from(Map<String, dynamic> source) {
    final promptTokens = source["prompt_tokens"];
    final completionTokens = source["completion_tokens"];
    final totalTokens = source["total_tokens"];
    return CompletionUsage(
      promptTokens: promptTokens is int ? promptTokens : null,
      completionTokens: completionTokens is int ? completionTokens : null,
      totalTokens: totalTokens is int ? totalTokens : null,
    );
  }

  Map<String, dynamic> get source {
    return {
      "prompt_tokens": promptTokens,
      "completion_tokens": completionTokens,
      "total_tokens": totalTokens,
    };
  }

  @override
  String toString() {
    return "Usage(${source.toString().replaceAll("{", "").replaceAll("}", "")})";
  }
}

class CompletionRequest {
  final String? model;
  final List<CompletionRequestMessage>? messages;
  final double? temperature;

  const CompletionRequest({
    this.model,
    this.messages,
    this.temperature,
  });

  Map<String, dynamic> get source {
    return {
      "model": model,
      "messages": messages?.map((e) => e.source).toList(),
      "temperature": temperature,
    };
  }
}

class CompletionRequestMessage {
  final String? role;
  final String? content;

  const CompletionRequestMessage({
    this.role,
    this.content,
  });

  Map<String, dynamic> get source {
    return {
      "role": role,
      "content": content,
    };
  }
}

abstract class TranscriptionData {
  const TranscriptionData();
}

class TextTranscriptionData extends TranscriptionData {
  final String? text;

  const TextTranscriptionData({
    this.text,
  });

  TextTranscriptionData copy({
    String? text,
  }) {
    return TextTranscriptionData(
      text: text ?? this.text,
    );
  }

  factory TextTranscriptionData.from(Map<String, dynamic> source) {
    return TextTranscriptionData(
      text: source["text"],
    );
  }

  Map<String, dynamic> get source {
    return {
      "text": text,
    };
  }
}

class WordTranscriptionData extends TranscriptionData {
  final String? task;
  final String? language;
  final double? duration;
  final String? text;
  final List<WordTranscriptionDatum>? words;

  const WordTranscriptionData({
    this.task,
    this.language,
    this.duration,
    this.text,
    this.words,
  });

  WordTranscriptionData copy({
    String? task,
    String? language,
    double? duration,
    String? text,
    List<WordTranscriptionDatum>? words,
  }) {
    return WordTranscriptionData(
      task: task ?? this.task,
      language: language ?? this.language,
      duration: duration ?? this.duration,
      text: text ?? this.text,
      words: words ?? this.words,
    );
  }

  factory WordTranscriptionData.from(Map<String, dynamic> source) {
    return WordTranscriptionData(
      task: source["task"],
      language: source["language"],
      duration: source["duration"]?.toDouble(),
      text: source["text"],
      words: source["words"] == null
          ? []
          : List<WordTranscriptionDatum>.from(
              source["words"]!.map((x) => WordTranscriptionDatum.from(x))),
    );
  }

  Map<String, dynamic> get source {
    return {
      "task": task,
      "language": language,
      "duration": duration,
      "text": text,
      "words":
          words == null ? [] : List<dynamic>.from(words!.map((x) => x.source)),
    };
  }
}

class WordTranscriptionDatum {
  final String? word;
  final double? start;
  final double? end;

  const WordTranscriptionDatum({
    this.word,
    this.start,
    this.end,
  });

  WordTranscriptionDatum copy({
    String? word,
    double? start,
    double? end,
  }) {
    return WordTranscriptionDatum(
      word: word ?? this.word,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  factory WordTranscriptionDatum.from(Map<String, dynamic> source) {
    return WordTranscriptionDatum(
      word: source["word"],
      start: source["start"]?.toDouble(),
      end: source["end"]?.toDouble(),
    );
  }

  Map<String, dynamic> get source {
    return {
      "word": word,
      "start": start,
      "end": end,
    };
  }
}

class SegmentTranscriptionData extends TranscriptionData {
  final String? task;
  final String? language;
  final double? duration;
  final String? text;
  final List<SegmentTranscriptionDatum>? segments;

  const SegmentTranscriptionData({
    this.task,
    this.language,
    this.duration,
    this.text,
    this.segments,
  });

  SegmentTranscriptionData copy({
    String? task,
    String? language,
    double? duration,
    String? text,
    List<SegmentTranscriptionDatum>? segments,
  }) {
    return SegmentTranscriptionData(
      task: task ?? this.task,
      language: language ?? this.language,
      duration: duration ?? this.duration,
      text: text ?? this.text,
      segments: segments ?? this.segments,
    );
  }

  factory SegmentTranscriptionData.from(Map<String, dynamic> source) {
    return SegmentTranscriptionData(
      task: source["task"],
      language: source["language"],
      duration: source["duration"]?.toDouble(),
      text: source["text"],
      segments: source["segments"] == null
          ? []
          : List<SegmentTranscriptionDatum>.from(source["segments"]!
              .map((x) => SegmentTranscriptionDatum.from(x))),
    );
  }

  Map<String, dynamic> get source {
    return {
      "task": task,
      "language": language,
      "duration": duration,
      "text": text,
      "segments": segments == null
          ? []
          : List<dynamic>.from(segments!.map((x) => x.source)),
    };
  }
}

class SegmentTranscriptionDatum {
  final int? id;
  final int? seek;
  final int? start;
  final double? end;
  final String? text;
  final List<int>? tokens;
  final int? temperature;
  final double? avgLogprob;
  final double? compressionRatio;
  final double? noSpeechProb;

  const SegmentTranscriptionDatum({
    this.id,
    this.seek,
    this.start,
    this.end,
    this.text,
    this.tokens,
    this.temperature,
    this.avgLogprob,
    this.compressionRatio,
    this.noSpeechProb,
  });

  SegmentTranscriptionDatum copy({
    int? id,
    int? seek,
    int? start,
    double? end,
    String? text,
    List<int>? tokens,
    int? temperature,
    double? avgLogprob,
    double? compressionRatio,
    double? noSpeechProb,
  }) {
    return SegmentTranscriptionDatum(
      id: id ?? this.id,
      seek: seek ?? this.seek,
      start: start ?? this.start,
      end: end ?? this.end,
      text: text ?? this.text,
      tokens: tokens ?? this.tokens,
      temperature: temperature ?? this.temperature,
      avgLogprob: avgLogprob ?? this.avgLogprob,
      compressionRatio: compressionRatio ?? this.compressionRatio,
      noSpeechProb: noSpeechProb ?? this.noSpeechProb,
    );
  }

  factory SegmentTranscriptionDatum.from(Map<String, dynamic> source) {
    return SegmentTranscriptionDatum(
      id: source["id"],
      seek: source["seek"],
      start: source["start"],
      end: source["end"]?.toDouble(),
      text: source["text"],
      tokens: source["tokens"] == null
          ? []
          : List<int>.from(source["tokens"]!.map((x) => x)),
      temperature: source["temperature"],
      avgLogprob: source["avg_logprob"]?.toDouble(),
      compressionRatio: source["compression_ratio"]?.toDouble(),
      noSpeechProb: source["no_speech_prob"]?.toDouble(),
    );
  }

  Map<String, dynamic> get source {
    return {
      "id": id,
      "seek": seek,
      "start": start,
      "end": end,
      "text": text,
      "tokens": tokens == null ? [] : List<dynamic>.from(tokens!.map((x) => x)),
      "temperature": temperature,
      "avg_logprob": avgLogprob,
      "compression_ratio": compressionRatio,
      "no_speech_prob": noSpeechProb,
    };
  }
}

enum Models {
  gpt3P5Turbo("gpt-3.5-turbo"),
  none("");

  final String name;

  const Models(this.name);
}

enum Roles { assistant, user }

enum TTSModels {
  tts1("tts-1"),
  tts1Hd("tts-1-hd");

  final String name;

  const TTSModels(this.name);
}

enum TTSVoices {
  alloy,
  echo,
  fable,
  onyx,
  nova,
  shimmer;
}

enum AudioFormats {
  mp3,
  opus,
  aac,
  flac,
  wav,
  pcm;
}

enum TranscriptionModels {
  whisper1("whisper-1");

  final String name;

  const TranscriptionModels(this.name);
}

enum TranscriptionTimestamps {
  word("word"),
  segment("segment");

  final String name;

  const TranscriptionTimestamps(this.name);
}

enum TranscriptionAudioSupports {
  flac,
  mp3,
  mp4,
  mpeg,
  mpga,
  m4a,
  ogg,
  wav,
  webm;
}

enum TranscriptionResponseFormats {
  json("json"),
  text("text"),
  srt("srt"),
  verboseJson("verbose_json"),
  vtt("vtt");

  final String name;

  const TranscriptionResponseFormats(this.name);
}

enum AudioSpeeds {
  x0P25(0.25),
  x4P0(4.0),
  x1P0(1.0);

  final double name;

  const AudioSpeeds(this.name);
}

class OpenAi {
  final String baseUrl;
  final String version;
  final String apiKey;
  final String? organizationKey;

  late final Dio _dio = Dio(BaseOptions(
    baseUrl: "$baseUrl/$version/",
    headers: {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationKey,
      "Content-Type": "application/json",
    },
  ));

  late final Dio _dioSender = Dio(BaseOptions(
    baseUrl: "$baseUrl/$version/",
    headers: {
      "Authorization": "Bearer $apiKey",
      "OpenAI-Organization": organizationKey,
      "Content-Type": "multipart/form-data",
    },
  ));

  OpenAi._({
    required this.baseUrl,
    required this.version,
    required this.apiKey,
    this.organizationKey,
  });

  static OpenAi? _i;

  static OpenAi get i => _i!;

  static OpenAi init({
    required String apiKey,
    String? organizationKey,
    String baseUrl = "https://api.openai.com",
    String version = "v1",
  }) {
    return _i ??= OpenAi._(
      baseUrl: baseUrl,
      version: version,
      apiKey: apiKey,
      organizationKey: organizationKey,
    );
  }

  Future<ModelResponse?> models() async {
    try {
      final response = await _dio.get("models");
      final code = response.statusCode;
      if (code == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return ModelResponse.from(data);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<CompletionResponse?> completion(CompletionRequest request) async {
    try {
      final response = await _dio.post(
        "chat/completions",
        data: request.source,
      );

      final code = response.statusCode;
      if (code == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return CompletionResponse.from(data);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> speech({
    required String text,
    TTSModels model = TTSModels.tts1,
    TTSVoices voice = TTSVoices.alloy,
    AudioFormats? audioFormat = AudioFormats.mp3,
    AudioSpeeds? speed = AudioSpeeds.x1P0,
  }) async {
    try {
      final response = await _dio.post(
        "audio/speech",
        data: {
          "input": text,
          "model": model.name,
          "voice": voice.name,
          "response_format": audioFormat?.name,
          "speed": speed?.name,
        },
      );

      final code = response.statusCode;
      if (code == 200) {
        final data = response.data;
        return data;
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<TranscriptionData?> transcriptions({
    required File file,
    String? language,
    String? prompt,
    double? temperature,
    TranscriptionTimestamps? granularities,
    TranscriptionResponseFormats? format,
    TranscriptionModels model = TranscriptionModels.whisper1,
  }) async {
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
      "model": model.name,
      if (language != null) "language": language,
      if (prompt != null) "prompt": prompt,
      if (format != null) "response_format": format.name,
      if (temperature != null) "temperature": temperature,
      if (granularities != null) "timestamp_granularities": granularities.name,
    });
    try {
      final response = await _dioSender.post(
        "audio/transcriptions",
        data: data,
      );

      final code = response.statusCode;
      if (code == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          if (granularities == TranscriptionTimestamps.segment) {
            return SegmentTranscriptionData.from(data);
          } else if (granularities == TranscriptionTimestamps.word) {
            return WordTranscriptionData.from(data);
          } else {
            return TextTranscriptionData.from(data);
          }
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Future<String?> translations({
    required File file,
    String? prompt,
    double? temperature,
    TranscriptionResponseFormats? format,
    TranscriptionModels model = TranscriptionModels.whisper1,
  }) async {
    final data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
      "model": model.name,
      if (prompt != null) "prompt": prompt,
      if (format != null) "response_format": format.name,
      if (temperature != null) "temperature": temperature,
    });
    try {
      final response = await _dioSender.post(
        "audio/translations",
        data: data,
      );

      final code = response.statusCode;
      if (code == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return data["text"];
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
