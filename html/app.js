window.addEventListener('message', function(e) {
    if (e.data.dancefloor == 'nightclubBahamas') {
		//console.log(JSON.stringify(e))
		if (e.data.musiccommand == 'playsong') {
			
		  if (nightclubBahamasplayer != null) {
			jQuery("#nightclubBahamasplayer").tubeplayer("pause");
			jQuery("#nightclubBahamasplayer").tubeplayer("seek", 0);
		  }
		  
		  //console.log(e.data.songname);
		  	jQuery("#nightclubBahamasplayer").tubeplayer("cue", e.data.songname);
	  
			jQuery("#nightclubBahamasplayer").tubeplayer("play");
			jQuery("#nightclubBahamasplayer").tubeplayer("volume", 0);
		} else if (e.data.musiccommand == 'pause') {
			jQuery("#nightclubBahamasplayer").tubeplayer("pause");
		} else if (e.data.musiccommand == 'stop') {
			jQuery("#nightclubBahamasplayer").tubeplayer("stop");
		} else if (e.data.musiccommand == 'play') {
			jQuery("#nightclubBahamasplayer").tubeplayer("play");
		} else if (e.data.setvolume !== undefined) {
		  if (e.data.setvolume >= 0.0 && e.data.setvolume <= 1.0) {
			var vol = e.data.setvolume;
			var corrigir = vol.toFixed(2);
			var resultado = (corrigir).replace('.','');
			var menosum = (resultado).substr(1);
			jQuery("#nightclubBahamasplayer").tubeplayer("volume", menosum);
			}
		}
	} else if(e.data.dancefloor == 'nightclubUnicorn') {
		//console.log(JSON.stringify(e))
		if (e.data.musiccommand == 'playsong') {
			
		  if (playernightclubUnicorn != null) {
			jQuery("#playernightclubUnicorn").tubeplayer("pause");
			jQuery("#playernightclubUnicorn").tubeplayer("seek", 0);
		  }
		  
		  //console.log(e.data.songname);
		  	jQuery("#playernightclubUnicorn").tubeplayer("cue", e.data.songname);
	  
			jQuery("#playernightclubUnicorn").tubeplayer("play");
			jQuery("#playernightclubUnicorn").tubeplayer("volume", 0);
		} else if (e.data.musiccommand == 'pause') {
			jQuery("#playernightclubUnicorn").tubeplayer("pause");
		} else if (e.data.musiccommand == 'stop') {
			jQuery("#playernightclubUnicorn").tubeplayer("stop");
		} else if (e.data.musiccommand == 'play') {
			jQuery("#playernightclubUnicorn").tubeplayer("play");
		} else if (e.data.setvolume !== undefined) {
		  if (e.data.setvolume >= 0.0 && e.data.setvolume <= 1.0) {
			var vol = e.data.setvolume;
			var corrigir = vol.toFixed(2);
			var resultado = (corrigir).replace('.','');
			var menosum = (resultado).substr(1);
			jQuery("#playernightclubUnicorn").tubeplayer("volume", menosum);
			}
		}
	} else if(e.data.dancefloor == 'nightclubunderground') {
		//console.log(JSON.stringify(e))
		if (e.data.musiccommand == 'playsong') {
			
		  if (playernightclubunderground != null) {
			jQuery("#playernightclubunderground").tubeplayer("pause");
			jQuery("#playernightclubunderground").tubeplayer("seek", 0);
		  }
		  
		  //console.log(e.data.songname);
		  	jQuery("#playernightclubunderground").tubeplayer("cue", e.data.songname);
	  
			jQuery("#playernightclubunderground").tubeplayer("play");
			jQuery("#playernightclubunderground").tubeplayer("volume", 0);
		} else if (e.data.musiccommand == 'pause') {
			jQuery("#playernightclubunderground").tubeplayer("pause");
		} else if (e.data.musiccommand == 'stop') {
			jQuery("#playernightclubunderground").tubeplayer("stop");
		} else if (e.data.musiccommand == 'play') {
			jQuery("#playernightclubunderground").tubeplayer("play");
		} else if (e.data.setvolume !== undefined) {
		  if (e.data.setvolume >= 0.0 && e.data.setvolume <= 1.0) {
			var vol = e.data.setvolume;
			var corrigir = vol.toFixed(2);
			var resultado = (corrigir).replace('.','');
			var menosum = (resultado).substr(1);
			jQuery("#playernightclubunderground").tubeplayer("volume", menosum);
			}
		}
	}
});