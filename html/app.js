var audioPlayer = null;
window.addEventListener('message', function(e) {
	//// console.log(JSON.stringify(e))
    if (e.data.musiccommand == 'playsong') {
  		
	  if (audioPlayer != null) {
		audioPlayer.pause();
		audioPlayer.currentTime = 0;
	  }
	  
	  console.log(e.data.songname);
	  audioPlayer = new Audio("./songs/"+e.data.songname);
	  audioPlayer.volume = 0.0;

	  audioPlayer.play();
	  // console.log(JSON.stringify(audioPlayer));
	} else if (e.data.musiccommand == 'pause') {
	  if (audioPlayer != null) {
		audioPlayer.pause();
	  }
	} else if (e.data.musiccommand == 'stop') {
	  if (audioPlayer != null) {
		audioPlayer.pause();
		audioPlayer.currentTime = 0;
	  }
	} else if (e.data.musiccommand == 'play') {
	  if (audioPlayer != null) {
		audioPlayer.play();
	  }
	} else if (e.data.setvolume !== undefined && audioPlayer != null) {
		if (e.data.setvolume >= 0.0 && e.data.setvolume <= 1.0) {
			// console.log(e.data.setvolume);
			audioPlayer.volume = e.data.setvolume;
		}
	}
});