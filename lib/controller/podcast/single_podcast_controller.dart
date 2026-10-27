import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tec/models/podcast_fileModel.dart';
import 'package:tec/services/dio_services.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id});

  RxBool loading = false.obs;

  Rx<PodcastFilemodel> podcastFileModel = PodcastFilemodel().obs;
  RxList<PodcastFilemodel> podcastListFile = RxList();
  final player = AudioPlayer();
  late var playList;
  RxBool playState = false.obs;
  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await getPodcastFiles();
    await player.setAudioSource(
      playList,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
  }

  getPodcastFiles() async {
    loading.value = true;

    var response = await DioServices().getMethod(
      "https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=get_files&podcats_id=$id",
    );
    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastListFile.add(PodcastFilemodel.fromjson(element));
        playList.add(
          AudioSource.uri(Uri.parse(PodcastFilemodel.fromjson(element).file!)),
        );
      }
      loading.value = false;
    }
  }
}
